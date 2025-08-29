use std::fs;
use zed::LanguageServerId;
use zed_extension_api::{self as zed, Result};

struct CobolExtension {
    cached_binary_path: Option<String>,
}

impl CobolExtension {
    /// Check if a given binary path exists and is a file.
    fn binary_exists(path: &str) -> bool {
        fs::metadata(path).map_or(false, |stat| stat.is_file())
    }

    /// Get the expected binary name based on the current platform.
    fn platform_binary_name() -> &'static str {
        match zed::current_platform().0 {
            zed::Os::Mac => "server-mac",
            zed::Os::Linux => "server-linux",
            zed::Os::Windows => "engine.exe",
        }
    }

    /// Determine the path to the language server binary.
    fn language_server_binary_path(
        &mut self,
        language_server_id: &LanguageServerId,
        worktree: &zed::Worktree,
    ) -> Result<String> {
        let binary_name = Self::platform_binary_name();

        if let Some(path) = worktree.which(binary_name) {
            if Self::binary_exists(&path) {
                return Ok(path);
            }
        }

        if let Some(path) = &self.cached_binary_path {
            if Self::binary_exists(path) {
                return Ok(path.clone());
            }
        }

        zed::set_language_server_installation_status(
            language_server_id,
            &zed::LanguageServerInstallationStatus::CheckingForUpdate,
        );

        let release =
            zed::github_release_by_tag_name("eclipse-che4z/che-che4z-lsp-for-cobol", "2.4.3")?;

        let (platform, arch) = zed::current_platform();
        let asset_basename = format!(
            "cobol-language-support-{os}-{arch}-{version}",
            version = &release.version,
            os = match platform {
                zed::Os::Mac => "darwin",
                zed::Os::Linux => "linux",
                zed::Os::Windows => "win32",
            },
            arch = match arch {
                zed::Architecture::Aarch64 => "arm64",
                zed::Architecture::X86 | zed::Architecture::X8664 => "x64",
            },
        );

        let download_url = format!(
            "https://github.com/eclipse-che4z/che-che4z-lsp-for-cobol/releases/download/{version}/{asset_basename}{ext}",
            version = &release.version,
            ext = if platform == zed::Os::Windows { "-signed.vsix" } else { ".vsix" }
        );

        let version_dir = format!("cobol-lsp-{}", release.version);
        let binary_path = format!(
            "{version_dir}/extension/server/native/{binary_name}",
            binary_name = binary_name
        );

        if !Self::binary_exists(&binary_path) {
            zed::set_language_server_installation_status(
                language_server_id,
                &zed::LanguageServerInstallationStatus::Downloading,
            );

            zed::download_file(&download_url, &version_dir, zed::DownloadedFileType::Zip)
                .map_err(|e| format!("Failed to download file: {:?}", e))?;

            fs::read_dir(".")
                .map_err(|e| format!("Failed to list working directory: {e}"))?
                .filter_map(Result::ok)
                .filter(|entry| entry.file_name().to_string_lossy() != version_dir)
                .for_each(|entry| {
                    let _ = fs::remove_dir_all(entry.path());
                });
        }

        if Self::binary_exists(&binary_path) {
            // Make the downloaded file executable
            zed::make_file_executable(&binary_path)
                .map_err(|e| format!("Failed to make file executable: {:?}", e))?;

            self.cached_binary_path = Some(binary_path.clone());
            Ok(binary_path)
        } else {
            Err("Failed to locate the language server binary after installation.".into())
        }
    }
}

impl zed::Extension for CobolExtension {
    fn new() -> Self {
        Self {
            cached_binary_path: None,
        }
    }

    fn language_server_command(
        &mut self,
        language_server_id: &LanguageServerId,
        worktree: &zed::Worktree,
    ) -> Result<zed::Command> {
        Ok(zed::Command {
            command: self.language_server_binary_path(language_server_id, worktree)?,
            args: vec!["pipeEnabled".to_string()],
            env: Default::default(),
        })
    }
}

zed::register_extension!(CobolExtension);

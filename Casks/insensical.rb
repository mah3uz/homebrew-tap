cask "insensical" do
  version "0.2.0"
  sha256 "2540aa6d821b5076d8f09a0993a12658f00c3136b56f0525cd9fee48bf9a831b"

  url "https://github.com/mah3uz/insensical-release/releases/download/v#{version}/insensical-#{version}-aarch64-apple-darwin.dmg"
  name "insensical"
  desc "Terminal multiplexer with a native window, for terminals and coding agents"
  homepage "https://insensical.com"

  depends_on arch: :arm64
  depends_on macos: ">= :ventura"

  app "insensical.app"
  binary "#{appdir}/insensical.app/Contents/MacOS/isc"
  bash_completion "#{appdir}/insensical.app/Contents/Resources/completions/isc.bash", target: "isc"
  zsh_completion "#{appdir}/insensical.app/Contents/Resources/completions/_isc"
  fish_completion "#{appdir}/insensical.app/Contents/Resources/completions/isc.fish"

  # The application carries no Developer ID, and macOS refuses to open one that was
  # downloaded until the mark a download leaves on it is taken off.
  postflight do
    system_command "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "#{appdir}/insensical.app"]
  end

  caveats <<~EOS
    insensical is not signed with a Developer ID or notarised by Apple.
  EOS
end

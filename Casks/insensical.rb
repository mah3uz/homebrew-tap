cask "insensical" do
  version "0.5.0"
  sha256 "344b1b5155b2c1b7669b34815eff61dfa13482ef854cef47154bebb93fa8cfb7"

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

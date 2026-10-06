class Quarry < Formula
  desc "Fast SQL client and TUI for PostgreSQL, MySQL / MariaDB and SQLite"
  homepage "https://quarry.asmechanics.com"
  url "https://github.com/mah3uz/quarry/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "8807b4193053bad2104d54212715ef37b95abcf85e8a15b29ad005a62e602550"
  license "MIT"
  head "https://github.com/mah3uz/quarry.git", branch: "main"

  bottle do
    root_url "https://github.com/mah3uz/homebrew-tap/releases/download/quarry-0.2.0"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "556fdc5033c29a99b0859b2e97688309d1df4b0db872120f2510825d87722359"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
    generate_completions_from_executable(bin/"quarry", "--completions")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/quarry --version")
    assert_equal "n\n1\n", shell_output("#{bin}/quarry :memory: -e 'select 1 as n' --format csv")
  end
end

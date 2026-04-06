class Sideshow < Formula
  desc "Content pack manager for AI CLI tools"
  homepage "https://github.com/arcavenae/sideshow"
  version "0.1.0-alpha.20260406.002014.82ea7a3"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20260406-002014-82ea7a3/sideshow-darwin-arm64"
    sha256 "4ac3b57e4816601eff283af90e65f91b8eb711c47b455e07ef12a513366184a7"
  elsif OS.mac?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20260406-002014-82ea7a3/sideshow-darwin-amd64"
    sha256 "d7b72b695d8d10a1081189b2e076753db61f3183d20b5255c2796b380a042c7c"
  elsif OS.linux?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20260406-002014-82ea7a3/sideshow-linux-amd64"
    sha256 "04f66aa50f98e73a188787e4cc5416411f442cccc4d624a5d66cb699d64fd45a"
  end

  def install
    if OS.mac? && Hardware::CPU.arm?
      bin.install "sideshow-darwin-arm64" => "sideshow"
    elsif OS.mac?
      bin.install "sideshow-darwin-amd64" => "sideshow"
    elsif OS.linux?
      bin.install "sideshow-linux-amd64" => "sideshow"
    end
  end

  test do
    assert_match "sideshow", shell_output("#{bin}/sideshow version 2>&1")
  end
end

class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260808.204509.686c13e"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260808-204509-686c13e/marvel-darwin-arm64"
    sha256 "c490b4893e3d9a07c4788124b36de0166ec7e94fd6c20af1d1352ca9749097d4"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260808-204509-686c13e/marvel-darwin-amd64"
    sha256 "72ab0ade5123391936e3cccb0144ee5a5fc818e75aeda238a92bcfe93cddb4e0"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260808-204509-686c13e/marvel-linux-arm64"
    sha256 "43d14bf6db1cff5974171de1731e6dc28ceed4280b1988e5e63e0b9c1a253a5a"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260808-204509-686c13e/marvel-linux-amd64"
    sha256 "6f20a8b579c00d2f963e704804da17729e7a6f0e49495fda7843d7c7a8145453"
  end

  def install
    if OS.mac? && Hardware::CPU.arm?
      bin.install "marvel-darwin-arm64" => "marvel"
    elsif OS.mac?
      bin.install "marvel-darwin-amd64" => "marvel"
    elsif OS.linux? && Hardware::CPU.arm?
      bin.install "marvel-linux-arm64" => "marvel"
    elsif OS.linux?
      bin.install "marvel-linux-amd64" => "marvel"
    end
  end

  test do
    assert_match "marvel", shell_output("#{bin}/marvel version 2>&1")
  end
end

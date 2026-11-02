class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261102.012857.c1976d3"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261102-012857-c1976d3/marvel-darwin-arm64"
    sha256 "db0bc45d1a69b4fd7912f24b39af06d7e48c03b5c0ac5f1149e2222761de03af"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261102-012857-c1976d3/marvel-darwin-amd64"
    sha256 "e1aa6ce3cc0161408b8d83a44322eaaa990a714f52a7a480f67cfeb40bb29929"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261102-012857-c1976d3/marvel-linux-arm64"
    sha256 "cdac85b77c8a8e1fb4ae054b555ccb779154485b807465f4746e3077a225055c"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261102-012857-c1976d3/marvel-linux-amd64"
    sha256 "ddc577d0bc43d8ce2ea580a71a6f055f6fc8c8b3e1da62183c41679966e964fa"
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

class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261015.185905.515451f"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261015-185905-515451f/marvel-darwin-arm64"
    sha256 "8cd122e73d6261ca19e90d71454145a2e51c5ce7072e0e9c03b6a3f7f44aef67"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261015-185905-515451f/marvel-darwin-amd64"
    sha256 "42e2c257e14bc9108b36f70dfd2de10ab0ef42f4c9e55ba6bd4fd8a4ac9239f0"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261015-185905-515451f/marvel-linux-arm64"
    sha256 "1792fe23a8d82407de23ee954a984388b6b89d4a86e88b9b04abd42ed599d562"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261015-185905-515451f/marvel-linux-amd64"
    sha256 "447cbff00651c904c06e1e696b6196603a464d245d542a32e8cf71200c785475"
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

class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260904.174309.3d0a17a"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260904-174309-3d0a17a/marvel-darwin-arm64"
    sha256 "bd7ca571fe81a51e0440b2c882d2dbb7e9a1082e09058bdfebc7fbf8563653f6"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260904-174309-3d0a17a/marvel-darwin-amd64"
    sha256 "96c15eca45cacd91206d6f3fe6678e47d61482c20fada0ade3fcfdfa630f7922"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260904-174309-3d0a17a/marvel-linux-arm64"
    sha256 "ff8bbb1cb07484396d19e8d4aa728d4ff51a3e900032aea9a8a24bd218523a21"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260904-174309-3d0a17a/marvel-linux-amd64"
    sha256 "0949b19bb3b1224d24cc2dc7913aacee986a2c32949c90d1eb637631764ca082"
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

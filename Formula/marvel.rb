class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261121.191233.2c25706"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261121-191233-2c25706/marvel-darwin-arm64"
    sha256 "01b81aa5a82f6d86c64e0c1cc456ddba17d6030347ddec29b47126352963f009"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261121-191233-2c25706/marvel-darwin-amd64"
    sha256 "a34d73671b52ec4c34f93b1e05cd95c3a0fbc959b15b91cbb6fc4e9702de5cef"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261121-191233-2c25706/marvel-linux-arm64"
    sha256 "ec228f8e5e8c4eeac8f2d12db3dda7d58316fdd2c70e3ecb13bfa24c38af253b"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261121-191233-2c25706/marvel-linux-amd64"
    sha256 "0df0589b79b4a7ca35cf146bad92fccce19246effb62695d949918ba8543722c"
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

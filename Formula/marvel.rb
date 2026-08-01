class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260801.185549.2be837a"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260801-185549-2be837a/marvel-darwin-arm64"
    sha256 "68be25b18e4d1b90339692c4ceccc7a7588e6ab727cb04a3e2d23c2c83cf8851"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260801-185549-2be837a/marvel-darwin-amd64"
    sha256 "29672deb60620f8e007c0360b52d873e2423406f6833164f267ab2d77ca01486"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260801-185549-2be837a/marvel-linux-arm64"
    sha256 "262d6672ed9ee23df015a28126aa4ea3bc53a4c838d57d9a395c9cafde5b5ddc"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260801-185549-2be837a/marvel-linux-amd64"
    sha256 "a56362bf8be54921a3c9601b965646d5ac196ba5c3e9566f2af7c2f5575875cd"
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

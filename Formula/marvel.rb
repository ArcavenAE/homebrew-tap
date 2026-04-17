class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260417.055452.4c7dbdf"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260417-055452-4c7dbdf/marvel-darwin-arm64"
    sha256 "f9d0df35b58be4e24a4844ded792bcec5feade9cb12a357c03d7a342821e4e9d"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260417-055452-4c7dbdf/marvel-darwin-amd64"
    sha256 "bc4ba949158dce2eb219d6c156267603958d37ffa3f56bf91e9c3b8f706d9239"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260417-055452-4c7dbdf/marvel-linux-arm64"
    sha256 "9633ad0737ba002fd280a2fe294d07c6ead6ed009bb24c99183dc441486d9be6"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260417-055452-4c7dbdf/marvel-linux-amd64"
    sha256 "67c6608c91882c4c1900ab5b15726bbd42b87b7f94ac82d6eb5869c65b0702c3"
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

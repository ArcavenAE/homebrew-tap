class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260916.085845.b798131"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260916-085845-b798131/marvel-darwin-arm64"
    sha256 "9aa52e74b47cb256ff934e6fd1bd3cd4965e4bb23ce9a307bbcf76095d07dc5f"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260916-085845-b798131/marvel-darwin-amd64"
    sha256 "722ef0225eaa9f384f5e456d6c3bbd14d700d39c69264f54cf30745a89e5f3d2"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260916-085845-b798131/marvel-linux-arm64"
    sha256 "e0813ef8c3d2801d7d03549cf50a8fa101d1f0374203a9903ab00fe9f73352f6"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260916-085845-b798131/marvel-linux-amd64"
    sha256 "3df3876d6410d55934d5f76137e1a04c585667b6d79ee36beadb3f4576e939e2"
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

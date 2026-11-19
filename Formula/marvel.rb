class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261119.044319.e22c8aa"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261119-044319-e22c8aa/marvel-darwin-arm64"
    sha256 "e97b410de9035710deb23de0f49d0fdcf6ee7a1c38c510b9bce20fd50b2e0784"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261119-044319-e22c8aa/marvel-darwin-amd64"
    sha256 "4f430b5c1a46af40fe1a05158014d7b60f2f65cd5eb27f79310b71eb05c3031f"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261119-044319-e22c8aa/marvel-linux-arm64"
    sha256 "64524356e268217ba58ee13e57ae9d7ee8d3825e441f5a224782042e26640cb8"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261119-044319-e22c8aa/marvel-linux-amd64"
    sha256 "05461328e15e3d4acb76d5c24076c6aafea83916f5a5dc0e5bd77aac8ce30e1e"
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

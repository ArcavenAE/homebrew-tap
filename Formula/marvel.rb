class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260914.223524.0b908f4"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260914-223524-0b908f4/marvel-darwin-arm64"
    sha256 "e73fa18e50ed2ceb3735995961524138cc738595fb72e56dfd7c3627e6ffe40e"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260914-223524-0b908f4/marvel-darwin-amd64"
    sha256 "5f9c9f93d936c45fe3de22daf1d1dc6466237a3371f23ded749d195a2abc9308"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260914-223524-0b908f4/marvel-linux-arm64"
    sha256 "c76c32194bf12c2f8aa5e5d8c39f6723b432020d187486221ebb6470d3d7d9a4"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260914-223524-0b908f4/marvel-linux-amd64"
    sha256 "4b9c40b4e61a6810b57a361f8c32fa3103e4375e5ee2485acd83fcd5ba5c6274"
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

class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260801.000536.7831d93"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260801-000536-7831d93/marvel-darwin-arm64"
    sha256 "c557e36310bbca8eed0bcbd0d1ed3ad04c944c622cb17cd6258d860fee3d4018"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260801-000536-7831d93/marvel-darwin-amd64"
    sha256 "1bf7b1e4b1a2a091e548245dc1cf371cdbab086806d44790e918a23f73879667"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260801-000536-7831d93/marvel-linux-arm64"
    sha256 "a06fd70664e8646417d12cb8ba14cac6c130c53da2f04f9c699f35707cfa227e"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260801-000536-7831d93/marvel-linux-amd64"
    sha256 "4eb1c9dfea901c1086e4f7be194f691e26c26e37b4f8534040105aac100d5c00"
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

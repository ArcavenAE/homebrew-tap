class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260915.220918.06981aa"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260915-220918-06981aa/marvel-darwin-arm64"
    sha256 "b04e247e1916166b02b4fcee1f75a3821d4f1234f2cc7b75fe57399e768cf4d2"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260915-220918-06981aa/marvel-darwin-amd64"
    sha256 "238a304e5517b9c28486ae1e1160486d49327bd391253394d7a1b3b8a2af08be"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260915-220918-06981aa/marvel-linux-arm64"
    sha256 "d6596a862e764dd4f7cfe73fda04b4abd7454cb08b478ad49b35b2ba938951bb"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260915-220918-06981aa/marvel-linux-amd64"
    sha256 "7c8f4bf063f0f873a9e643dca6c0e52c587dbb6b039a7c3019eba581fa21312b"
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

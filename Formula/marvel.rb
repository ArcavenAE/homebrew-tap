class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261010.083729.493de32"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261010-083729-493de32/marvel-darwin-arm64"
    sha256 "589bdfc346d55d6548f3f0b1972267ce1fe7e249449bd7ed65f2f62347c87f0e"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261010-083729-493de32/marvel-darwin-amd64"
    sha256 "75ff2e6231e9618a7b0ff762afc9dbbc0d73e3f2d51ade982605641ebdd21b28"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261010-083729-493de32/marvel-linux-arm64"
    sha256 "36d8bf77fa103136c651fa51f4e701b3c7e4a19e492febf4e73306636f02344e"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261010-083729-493de32/marvel-linux-amd64"
    sha256 "fffcf7ed5bf3f13111505833bfe6c949516f4b17b8f625b670a858b41c1380e1"
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

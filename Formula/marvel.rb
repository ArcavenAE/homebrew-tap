class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261021.180235.363e7bb"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261021-180235-363e7bb/marvel-darwin-arm64"
    sha256 "1b826a8958f7831555f898500441c699342742507a6ecc3813c033ebd10710bf"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261021-180235-363e7bb/marvel-darwin-amd64"
    sha256 "66a4002a2bb40a2defc5bb89955d20957793a740879d13877276594a935033ba"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261021-180235-363e7bb/marvel-linux-arm64"
    sha256 "89dde7026cd339dc1680ba3b361be3e2ce2665c39161c8845227c3494f791532"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261021-180235-363e7bb/marvel-linux-amd64"
    sha256 "972964638848bef030250fc93bbdbc2376ee5c7f4d26b13e1aacec51a4b1c689"
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

class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260830.063914.f1032e3"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260830-063914-f1032e3/marvel-darwin-arm64"
    sha256 "d3ad9302d53fef4750e7d513a7b901e69ecd47cd846a303e71c576e853d1d2a1"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260830-063914-f1032e3/marvel-darwin-amd64"
    sha256 "59c7b45eae959bdaaf5119e1194c598bd485ccc860153d43d9b0f5466208516d"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260830-063914-f1032e3/marvel-linux-arm64"
    sha256 "c4c9b96663146b3fe0ac485e36372c9935c83fb918c599baace6b2c40208c71e"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260830-063914-f1032e3/marvel-linux-amd64"
    sha256 "e582c7e151a23a3ec12a4795834348648ec2a9ef72a226141feb9fabd62ccf6d"
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

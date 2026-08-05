class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260805.181017.fd58620"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260805-181017-fd58620/marvel-darwin-arm64"
    sha256 "9499d9147a5932bfed937330b917d2c4ea79e084964db4e07f7db13210e14322"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260805-181017-fd58620/marvel-darwin-amd64"
    sha256 "9d8821f80d88044892c9242122cefd2ae40967dd1ffeb286e2991eb479e63fda"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260805-181017-fd58620/marvel-linux-arm64"
    sha256 "1f6d06d94fec1150cee5e2700b7adbb5af3fbed1315286f1ed89ca6ec55fbecf"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260805-181017-fd58620/marvel-linux-amd64"
    sha256 "f37ad3b26a7e1afbd16f8dad99f05fcb768e47d6eb770e49013b09c3b0cbfaf9"
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

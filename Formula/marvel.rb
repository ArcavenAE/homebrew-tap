class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261117.234455.00cb944"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261117-234455-00cb944/marvel-darwin-arm64"
    sha256 "9cb75d6f4de9859939864dfe8bf80e6dc6c799b61297af384ceeaedffdb8ed95"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261117-234455-00cb944/marvel-darwin-amd64"
    sha256 "cca6f9fd2dc568115b7e3b9e02cca44f4038c9cf20211e49da63f31871369b76"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261117-234455-00cb944/marvel-linux-arm64"
    sha256 "f999cb9555e90af0eb84466a97ee91a659bcb6936a1ddb69c2468c0524fb3554"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261117-234455-00cb944/marvel-linux-amd64"
    sha256 "64fc34cebd863de537867850501712436dcbf3334e10d809689cc5ce9d2ce527"
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

class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260830.063717.eca860a"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260830-063717-eca860a/marvel-darwin-arm64"
    sha256 "652ceef0d20e18ab1cf75401bf3922c5e8c1e29a88602c346ddf28484cb78190"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260830-063717-eca860a/marvel-darwin-amd64"
    sha256 "bcadeb00133d56a4773f549eba34fcde789fe096fad446f5bcc03bd073422c4a"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260830-063717-eca860a/marvel-linux-arm64"
    sha256 "3e74b3e8674762972152c56d1b73fabeaefdcaa8351d3ef72d589b6835cb9680"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260830-063717-eca860a/marvel-linux-amd64"
    sha256 "8eca13d63a2d7f443453cd0025d6bc5deac84ab757a015314806706e872b60e5"
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

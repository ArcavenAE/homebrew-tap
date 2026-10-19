class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261019.085108.f9e4315"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261019-085108-f9e4315/marvel-darwin-arm64"
    sha256 "7be28ed1708b9969f08a6086c2f8f06c6feec39c85e828b8c5b661d585b4b162"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261019-085108-f9e4315/marvel-darwin-amd64"
    sha256 "97c50547809b1818bfb117df32bdea9afc3f87f635276dd909059f3336e86ef3"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261019-085108-f9e4315/marvel-linux-arm64"
    sha256 "484942124afb49ce0b4a8f3fdde8ec3db74687688320c3560c15930cb8816692"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261019-085108-f9e4315/marvel-linux-amd64"
    sha256 "c19706256dfb488c7fec1e51493f46c09b9f546e99660ed72cbb9162502cbb41"
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

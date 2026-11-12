class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261112.184826.4ffffc3"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261112-184826-4ffffc3/marvel-darwin-arm64"
    sha256 "f06eec168a043157e928aa099978815e7c6aba3a39adb34012233a12ea0d154b"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261112-184826-4ffffc3/marvel-darwin-amd64"
    sha256 "f97809afa73d41757cccf1608ea858061e6bf0cf4e9f8bc50a99c070fad91182"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261112-184826-4ffffc3/marvel-linux-arm64"
    sha256 "18aee1129431aa2a37442b59b37366ab0d336c44e259be21cd0a4d8022dcdce0"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261112-184826-4ffffc3/marvel-linux-amd64"
    sha256 "0e95c16188b552d0d950cff3c1944db227ca39d3a45c11bf5a8b8a1f976a376e"
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

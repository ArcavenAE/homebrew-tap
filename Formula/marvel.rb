class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261002.213413.768788a"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261002-213413-768788a/marvel-darwin-arm64"
    sha256 "7303de4b26a8ab304b9a384d3daa3fc7a5fb1c210eae98db0c6754f88937d723"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261002-213413-768788a/marvel-darwin-amd64"
    sha256 "6e83a0ecb2261210f58e17a9d8c49dcec8f4e1a6da9b50a8aab9500241de9325"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261002-213413-768788a/marvel-linux-arm64"
    sha256 "b4c460ea04e373778c7a31d72776732fe844f843ae31bdf536ef6b78c0c97a0d"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261002-213413-768788a/marvel-linux-amd64"
    sha256 "34c3df14aeea40367461ed543c6807cc716fe5775d18010d3a0d19fdb205cb29"
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

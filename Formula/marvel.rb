class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261116.233638.73122c6"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261116-233638-73122c6/marvel-darwin-arm64"
    sha256 "0d4eebbc766bd07941408e6de87901d5e310eab2745d126c74e7920050d8786c"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261116-233638-73122c6/marvel-darwin-amd64"
    sha256 "b14ee3c3e2144f2641474c21689cd1e375fc15140ba276019363002750ddf240"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261116-233638-73122c6/marvel-linux-arm64"
    sha256 "f4d3e7aee8939a94fbcf5c4490e27af829d751ecfe9392bb30b770921a5ebc94"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261116-233638-73122c6/marvel-linux-amd64"
    sha256 "818d3207df2ae29b1aaea862b4b3900e8835659aafadb232d24e290313bc2e27"
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

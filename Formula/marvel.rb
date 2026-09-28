class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260928.042427.c892feb"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260928-042427-c892feb/marvel-darwin-arm64"
    sha256 "f89bd759689b17c4e98b4d12a39e2790d51d08b297d5e3d88ce2cf5b403e4118"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260928-042427-c892feb/marvel-darwin-amd64"
    sha256 "54d0a426222275501615e479c6370caba7bf165503919552315c29e60dec6639"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260928-042427-c892feb/marvel-linux-arm64"
    sha256 "c4724c6f3f8b5168c00ae69be4010caa7c1315820342629f8ce7a3cde6ac1687"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260928-042427-c892feb/marvel-linux-amd64"
    sha256 "cc221b88f4912ba8d28878fa7e6ba468bfae328729feb581e9b81e0ee45b50c4"
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

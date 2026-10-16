class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261016.002921.ac67c07"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261016-002921-ac67c07/marvel-darwin-arm64"
    sha256 "276b170ba70b1e4f8e9ecc9c783b31fdfe494db05a6092421a19161a8cbc1e2f"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261016-002921-ac67c07/marvel-darwin-amd64"
    sha256 "d5881d57156b1f0185606b1577bb39c398d2d4eeaf599c533c7883870fc718e0"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261016-002921-ac67c07/marvel-linux-arm64"
    sha256 "cbde84d4d412fb1b57ea81fd60c625435cb126f2579fb7bc133244f86215b93c"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261016-002921-ac67c07/marvel-linux-amd64"
    sha256 "b68ae9884f7bc32226ee64fd493a9b9546cbb96ba6dc8df0daa9933b6494cafe"
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

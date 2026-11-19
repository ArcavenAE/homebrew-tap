class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261119.214410.dd7a30d"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261119-214410-dd7a30d/marvel-darwin-arm64"
    sha256 "72ce245207871cac9464b8f7869c42eaef73fb3025fec129b95b840d231eb380"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261119-214410-dd7a30d/marvel-darwin-amd64"
    sha256 "40d6f11fd3ee5511f0d38b29ef1af65c8705d15b8fd1f303a853b5e11ee61753"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261119-214410-dd7a30d/marvel-linux-arm64"
    sha256 "ab68cfdf839f24057c757da5d2a6092a21ad94e0db4a1b96e1af21849dd66067"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261119-214410-dd7a30d/marvel-linux-amd64"
    sha256 "e2d087aded27fa1a3b83acb1b4d4364f897d4f4d03cde17510e41f33dfca68ee"
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

class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261109.144218.e386827"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261109-144218-e386827/marvel-darwin-arm64"
    sha256 "e034232dd6b3c7378d3645e6c53ae9f6f6075b43476c64f22b388cc94859119b"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261109-144218-e386827/marvel-darwin-amd64"
    sha256 "b2238c2d79a609fa0047e56503cfa1260124f8a6ec5b57c0aafd2a12d1ff371f"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261109-144218-e386827/marvel-linux-arm64"
    sha256 "abb2942286a3e1c858c1cef342b08751aff9daa9e1bb59177b9d6cde403602cb"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261109-144218-e386827/marvel-linux-amd64"
    sha256 "6b7c379c43d1cf2c3d9c8d8d5fa9e9f1b0d065bd78b86f54a25239556a9dda13"
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

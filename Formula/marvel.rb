class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261022.180145.496ec04"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261022-180145-496ec04/marvel-darwin-arm64"
    sha256 "3778f60d1230f3f56b70f841952725210bf57fbd09cbcda8990bf23020f45431"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261022-180145-496ec04/marvel-darwin-amd64"
    sha256 "4ea028101b6f642d7d638944534dc956430dbb8df1aca6901b67cfaa41afc05f"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261022-180145-496ec04/marvel-linux-arm64"
    sha256 "c1752e962eebef6d0137152a97cbda6c2ca4b6790fe5af351b505f8f403aeeb3"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261022-180145-496ec04/marvel-linux-amd64"
    sha256 "6d10dc2b2047bf693e0223b06f4836477ed311782fff4503ea19e9f22baaca51"
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

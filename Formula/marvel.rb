class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261006.200530.c5119f5"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261006-200530-c5119f5/marvel-darwin-arm64"
    sha256 "41ab2fca6fb58099a6b39831c607a7ed6299bb072e46225de2a202f65afe9de0"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261006-200530-c5119f5/marvel-darwin-amd64"
    sha256 "33fa67b856649349326a78f97b214354f4d4103b6c38e7bd0f66c972a7188325"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261006-200530-c5119f5/marvel-linux-arm64"
    sha256 "35f08c4f20314d1f9614ce4706ce82d7934298cd49e1d4afe3af4ee2925a717c"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261006-200530-c5119f5/marvel-linux-amd64"
    sha256 "0d834c1e0308b33d879be5e69adc4f75c133952c05c6ce455598c57ebbb93c2f"
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

class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260809.015914.5e156f8"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260809-015914-5e156f8/marvel-darwin-arm64"
    sha256 "bed3ab28fab0e2a8f9a66c4154b924a0b3e65a39218683bf958daf876f7e0780"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260809-015914-5e156f8/marvel-darwin-amd64"
    sha256 "57514fd8b6864aba9d7f02f28cf5ca2f143e48e23da5a93fcc647de955ae984f"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260809-015914-5e156f8/marvel-linux-arm64"
    sha256 "ee066061cbb5a9f55264da7e6d78cab2d2156c433986acd7485ebee23da296c3"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260809-015914-5e156f8/marvel-linux-amd64"
    sha256 "19c8f91dbe03de96e2bc547458183cc760d3478064f8d4b748d23e0649418890"
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

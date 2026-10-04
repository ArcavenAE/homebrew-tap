class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261004.180737.988a4a8"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261004-180737-988a4a8/marvel-darwin-arm64"
    sha256 "1d64ece81c412f4165d25aa6bcdf0c75cfc95f777f8c704fe8f807b9c8eb6a2a"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261004-180737-988a4a8/marvel-darwin-amd64"
    sha256 "93d11c3650a35c06accc73b231d89de5d8afb212bdb000623054df58790a6476"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261004-180737-988a4a8/marvel-linux-arm64"
    sha256 "07bd87895d7254d545b0fbf83cf45d0cc69903e5094f645b3171ab2d06032692"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261004-180737-988a4a8/marvel-linux-amd64"
    sha256 "b908ebf00734f78cf21ced82b41c8999a9e5de3d9bcc6c40f7dfd7d3c58a27d0"
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

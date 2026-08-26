class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260826.040604.ce316e5"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260826-040604-ce316e5/marvel-darwin-arm64"
    sha256 "e999eaa38fa2a11417b206d63f70608448bdaf6ef538b560a89183a5a8819925"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260826-040604-ce316e5/marvel-darwin-amd64"
    sha256 "78da6a8799bfbef5f41a1f139c60afd524017c950415dc747db427f55ac7eeac"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260826-040604-ce316e5/marvel-linux-arm64"
    sha256 "5581cd60a63b4c8a310adfcdf0f71125a32367d229001fe17d6b2e5a14edf15f"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260826-040604-ce316e5/marvel-linux-amd64"
    sha256 "822b83054fbb64901c1cc2cac7186d421979c262a305db12de69a24a886fc987"
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

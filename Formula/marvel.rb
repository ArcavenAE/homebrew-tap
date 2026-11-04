class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261104.194201.4420595"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261104-194201-4420595/marvel-darwin-arm64"
    sha256 "c039fb20fa5b5bc284f72869a5af371a41c987841c578553729766ff69187f9d"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261104-194201-4420595/marvel-darwin-amd64"
    sha256 "d3a3b115c178507bedc862836010d1bb575181609a9fd9892c7ba2370e8de772"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261104-194201-4420595/marvel-linux-arm64"
    sha256 "2a26eccd121adbb3ddca6a3dc3cb1acd49ebbed219bfc267240d1eaa22e2dbbb"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261104-194201-4420595/marvel-linux-amd64"
    sha256 "ebf7d6ce2a5c53fc85b6615cfff0981266398b238f4b3cea87117d31947221f2"
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

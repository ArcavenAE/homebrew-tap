class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260917.223456.55d37f5"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260917-223456-55d37f5/marvel-darwin-arm64"
    sha256 "da8a2b7498fe294bdee5411117d709ebae675b845ea137d84da0194449cc874d"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260917-223456-55d37f5/marvel-darwin-amd64"
    sha256 "c1d8fdb4bdb4d002f444077650e227a0a69abf2a493156948621eb59f250493a"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260917-223456-55d37f5/marvel-linux-arm64"
    sha256 "1cd3f55477eb75e8d1b83e91d3a20126560243df5e776a03b708f08ef77cfbbb"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260917-223456-55d37f5/marvel-linux-amd64"
    sha256 "f21723441baeb1581a76f1cc2b72d0508c2ede2d922483c3f3a00c42ffd92edf"
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

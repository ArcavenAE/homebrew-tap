class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260926.035147.222478a"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260926-035147-222478a/marvel-darwin-arm64"
    sha256 "320576ab2ef555f53f329c0ffccf5cf3ed863cba5a8c148f63b0712b882dea3c"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260926-035147-222478a/marvel-darwin-amd64"
    sha256 "10f07c4c71cd76de8e55a5b44f3e3a9bcdc2646a3acf0d747d53b4c89abd37d3"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260926-035147-222478a/marvel-linux-arm64"
    sha256 "c4c7cc1f00e60e360e9d62e79159aa3940790d564681be9203bf1217a8e4cbf4"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260926-035147-222478a/marvel-linux-amd64"
    sha256 "24212b914b721a165a986c3c481953707de3ee97d53be6a12e2e936ef0e81b7a"
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

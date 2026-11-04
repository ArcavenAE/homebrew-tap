class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261104.180634.203e90c"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261104-180634-203e90c/marvel-darwin-arm64"
    sha256 "5f8e9bff1ed5a19e8c9b5c08c2b5f9f0d0f4796738df92e69163d12dc94421b4"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261104-180634-203e90c/marvel-darwin-amd64"
    sha256 "5c665b3ca5dac00189bac8ecd265a6275e1c8742428abd091bf9191ec0f7e14e"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261104-180634-203e90c/marvel-linux-arm64"
    sha256 "c11f3d3bda82091ec6ca75a5292b6de27476a726bd27ff4b48ae5c9e6beb0e98"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261104-180634-203e90c/marvel-linux-amd64"
    sha256 "3193daeceb5c5b6c0af76b7fcb1057e5323878ffe97449925ab597904ed6ba74"
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

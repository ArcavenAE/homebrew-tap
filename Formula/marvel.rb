class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260925.184905.8cf3174"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260925-184905-8cf3174/marvel-darwin-arm64"
    sha256 "d3d803649112f798325782949a778b5f67ab80939e885daf607b97014e0fd423"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260925-184905-8cf3174/marvel-darwin-amd64"
    sha256 "9325fe4d946d7c9eb3bbd2206f5f715c54ac3eb4ca56a4ccd3d48167b74d7890"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260925-184905-8cf3174/marvel-linux-arm64"
    sha256 "ecd3abe6e2229a3c868d467b8413d394f3115b1835df7396a8ed147d595468eb"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260925-184905-8cf3174/marvel-linux-amd64"
    sha256 "d0bfdd7ad6bf5d39356b7fad68f75636575d2892ccd83f281cb69a659449f194"
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

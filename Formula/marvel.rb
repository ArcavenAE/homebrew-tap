class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260717.165935.27ceaf2"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260717-165935-27ceaf2/marvel-darwin-arm64"
    sha256 "850d2be29ea2fb6c402a7025fb8590575b4ee2fe88e6efc481b3e5386d8087bf"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260717-165935-27ceaf2/marvel-darwin-amd64"
    sha256 "7118a5766b412fc036136face1dfabe87414874d21b27da2ed2447ecee4c76b0"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260717-165935-27ceaf2/marvel-linux-arm64"
    sha256 "6e6fa0a701d31d9440b3df215ef3e153ac0c84521e9992fb7aac3316448cb980"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260717-165935-27ceaf2/marvel-linux-amd64"
    sha256 "7a894be64d0668f64c02dc177426151378a6989aedf4a3722bb56337f682f2ec"
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

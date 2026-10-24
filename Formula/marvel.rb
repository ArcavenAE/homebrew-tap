class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261024.230148.1e80c2d"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261024-230148-1e80c2d/marvel-darwin-arm64"
    sha256 "9ec3ca6efd83a38624f63ab2398bf501169329666c57819a405880dbb62ca070"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261024-230148-1e80c2d/marvel-darwin-amd64"
    sha256 "40be9b40c1148cdbf2baa9b51ff68d0257bac9c30a525003337a5d5d7b8ea68f"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261024-230148-1e80c2d/marvel-linux-arm64"
    sha256 "fea46c94116474f419fbdc57a7d65baf087183552acd1c7c9617b370ee5237af"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261024-230148-1e80c2d/marvel-linux-amd64"
    sha256 "d99cc74e0b197897d0a74ed6e5ef80aafd6776f44dca7a7b1173d56c6b597470"
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

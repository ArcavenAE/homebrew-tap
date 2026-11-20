class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261120.164602.50f7abf"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261120-164602-50f7abf/marvel-darwin-arm64"
    sha256 "4e4b2958935a19be495fa69571a83a9916b0739518d37bbd4a1bb82aa449a1d9"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261120-164602-50f7abf/marvel-darwin-amd64"
    sha256 "e759625d2de22585cf919ade6ec186493908224519aa2bffc3ee566fe7d612ba"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261120-164602-50f7abf/marvel-linux-arm64"
    sha256 "6c5d9f6a8dcc4deb80e7d426b6d413e7bf398ca33142386d9cf894617bb02b72"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261120-164602-50f7abf/marvel-linux-amd64"
    sha256 "0df00bfa5a8585b76e5bc2a24e381812ac5680cac7e03ae42c8b2078951f01a4"
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

class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261102.031948.8587651"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261102-031948-8587651/marvel-darwin-arm64"
    sha256 "0de65dddfc645d3a48228d2e38e5de42c26d48fdef27ddec9d1dd62583461f83"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261102-031948-8587651/marvel-darwin-amd64"
    sha256 "3338ffb688526803acb3a468a78249cf05d5bd4af6308da933409dab27cdf62e"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261102-031948-8587651/marvel-linux-arm64"
    sha256 "186a1e4456ca29c38cee6878a66dc39bdcbed1e7dc17ea70dabbccbf34359632"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261102-031948-8587651/marvel-linux-amd64"
    sha256 "d3a39390c63547882c6df506f7bbb31c0c4f9bf55460efadee238f6b21de0bd7"
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

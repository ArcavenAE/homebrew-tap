class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261002.191301.ceb4e78"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261002-191301-ceb4e78/marvel-darwin-arm64"
    sha256 "03e4e9994219b65222981f8ac2c06ac161be771255ed56ccecd9966ac81926d5"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261002-191301-ceb4e78/marvel-darwin-amd64"
    sha256 "0152b129ca63d911c32dd1a8c4953942eb2144f866bd4d8a17aac8bdce6fb58f"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261002-191301-ceb4e78/marvel-linux-arm64"
    sha256 "025ee9e6020636e742c408eac55cf56652e9be8365424e519c9d6c5cd0f9af91"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261002-191301-ceb4e78/marvel-linux-amd64"
    sha256 "a8b661c1e4a8580da6e60b83dec594bf40a3673b5441905d5855b110683a6e68"
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

class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261109.222558.54b8145"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261109-222558-54b8145/marvel-darwin-arm64"
    sha256 "a91d43118a15ba1dcefc240d7277f3a43a37e596c8c00836b4362defead3c14d"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261109-222558-54b8145/marvel-darwin-amd64"
    sha256 "4ddf585fad7faa83bb5c4fb32e48cfb4f6c85c2013b903d6b39df5720087dd3f"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261109-222558-54b8145/marvel-linux-arm64"
    sha256 "ebe4dd7104c0af089d3b3a3f6e626db7bb78cd31546cd538c4e5091353919920"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261109-222558-54b8145/marvel-linux-amd64"
    sha256 "968aa803c0aea41605147e5ef6d5f22726facc11b09558b6fdf62303e34ee3f4"
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

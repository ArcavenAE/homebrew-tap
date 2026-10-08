class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261008.230553.279714f"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261008-230553-279714f/marvel-darwin-arm64"
    sha256 "7f051a7b7dde2f1dd5161be17121f4437b4373939873f4a148edc3f198bf02c2"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261008-230553-279714f/marvel-darwin-amd64"
    sha256 "149a6858522ff1d55c592846491fda52db9c36b7c69679c5c6d3793c96d93be0"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261008-230553-279714f/marvel-linux-arm64"
    sha256 "8d9be3193c5c3a95b31f1dd72bb4c85de07f354e75c14048f7392961b5ef8164"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261008-230553-279714f/marvel-linux-amd64"
    sha256 "2a3740750f9d66afb63d2a8ddb2b6c0e6b3947d28c1f8c114d9e146079a2a052"
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

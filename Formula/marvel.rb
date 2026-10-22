class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261022.182132.7c7334a"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261022-182132-7c7334a/marvel-darwin-arm64"
    sha256 "aa265b237977d09708c11d6739dacbb5e97550d3533c32702fdfa9b488cc37a0"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261022-182132-7c7334a/marvel-darwin-amd64"
    sha256 "af830a4474d111d3b771d146184a487d116d80d3e0191cac22c588d008dcb701"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261022-182132-7c7334a/marvel-linux-arm64"
    sha256 "6d375df42cbfa4316b68d084f4a331037198681c71876132b155725192d21f12"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261022-182132-7c7334a/marvel-linux-amd64"
    sha256 "476e220d2d79bba54213c35dd67ee9fd7b33c2688c07b5a5f896dfd91fdad380"
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

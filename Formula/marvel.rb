class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260826.040054.d408175"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260826-040054-d408175/marvel-darwin-arm64"
    sha256 "fd30cabbec88e9f4585ea58634e98edd9eac77da6d51652836ff651991a19fe5"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260826-040054-d408175/marvel-darwin-amd64"
    sha256 "fd8085be59915bcaa4073645efde5171754ff742b87088c5b7b1a4d12aca8eb8"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260826-040054-d408175/marvel-linux-arm64"
    sha256 "2d9763b58d776d8644ec5549b7a3c0202ef9735fd13e21c4baa28ba0e4f38c9c"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260826-040054-d408175/marvel-linux-amd64"
    sha256 "818cbfb326ab99d9ad45db57861a18c50684eb36396a9dc1c5ed68353193feef"
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

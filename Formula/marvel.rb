class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261022.094830.39b9caa"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261022-094830-39b9caa/marvel-darwin-arm64"
    sha256 "1bc3cc10db59a5f112fc427cc10070f28c6fca48b3db25c16e9048ae036ffe4f"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261022-094830-39b9caa/marvel-darwin-amd64"
    sha256 "c652cf62bdf604e912080ac1cf40a4620957bde10eb9f5230ef75f35b8a0a2df"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261022-094830-39b9caa/marvel-linux-arm64"
    sha256 "f7207a91dcd4caebc50038b65993e8dd9a3acd1c99fe1cc83b28e0e6024db49d"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261022-094830-39b9caa/marvel-linux-amd64"
    sha256 "945f49742218348d1c4292fdfb9f36e449fd32a232691847bfb3e5e0c587812a"
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

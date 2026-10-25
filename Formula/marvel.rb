class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261025.044856.8b9b6ea"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261025-044856-8b9b6ea/marvel-darwin-arm64"
    sha256 "15c072577a9ae2497388b7ba77cea4f7546895ef88f3df95b64b1c9017f6fdb8"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261025-044856-8b9b6ea/marvel-darwin-amd64"
    sha256 "c025656f5ec0c46b005560f801116ec4dc6b7c596467575241fc7b5b83ebdcbd"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261025-044856-8b9b6ea/marvel-linux-arm64"
    sha256 "23b276cea56675c9ba173b7fa33f913a50e591d5ebc342bf60e1891fbdcbf464"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261025-044856-8b9b6ea/marvel-linux-amd64"
    sha256 "0160031b3f740914f7c4039edd1ffd10f3f17956d089d9cecc3e977f7d845cb7"
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

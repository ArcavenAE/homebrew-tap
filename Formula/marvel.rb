class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261002.194944.7177ca2"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261002-194944-7177ca2/marvel-darwin-arm64"
    sha256 "1d77804a0ee91a9863b3882eb2db6084120d3fca27f3edbca4c7dd894236893e"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261002-194944-7177ca2/marvel-darwin-amd64"
    sha256 "502dd6c8f829440483f1a6ffbb0762eaf7678bf6c478442a357fb57ab480aae5"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261002-194944-7177ca2/marvel-linux-arm64"
    sha256 "16080afa61ad3eb3ba6e21f254040f95a79835780b5e65e4f046e273c88bde06"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261002-194944-7177ca2/marvel-linux-amd64"
    sha256 "1d083814efcc30f8ba72156ef75997bbf86c40f3e290800eb03807a2bca1140c"
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

class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261109.210440.d917bcd"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261109-210440-d917bcd/marvel-darwin-arm64"
    sha256 "16b55667fe4edbd58d6e64ea7e484e1fe5d266d9113a9e400b0b405097f2cc88"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261109-210440-d917bcd/marvel-darwin-amd64"
    sha256 "3ac04e149e7956e831aded61d1252c101b54583a5443a084435d2d30ad15a037"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261109-210440-d917bcd/marvel-linux-arm64"
    sha256 "83ad45f2ffea19506899d00abfb52dbcefe4738e6e744b20b992abd5f1db854b"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261109-210440-d917bcd/marvel-linux-amd64"
    sha256 "19a36673dbaa19110d68012acf580b305408ed1d2c4a6d031410fd308a58f40b"
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

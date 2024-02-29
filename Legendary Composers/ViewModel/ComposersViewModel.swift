//
//  ComposersViewModel.swift
//  Legendary Composers
//
//  Created by Azim Güneş on 29.02.2024.
//

import Foundation

class ComposersViewModel {
    
    private(set) var composers: [Composer] = [
        Composer(id: .beethoven,
                 name: "Ludwig van Beethoven",
                 info: "udwig van Beethoven was a German pianist and composer widely considered to be one of the greatest musical geniuses of all time. His innovative compositions combined vocals and instruments, widening the scope of sonata, symphony, concerto and quartet. He is the crucial transitional figure connecting the Classical and Romantic ages of Western music.",
                 death: .init(date: 1827, country: .austria),
                 birthday: 1770),
        
        Composer(id: .mozart,
                 name: "Wolfgang Amadeus Mozart",
                 info: "Wolfgang Amadeus Mozart was a musician capable of playing multiple instruments who started playing in public at the age of 6. Over the years, Mozart aligned himself with a variety of European venues and patrons, composing hundreds of works that included sonatas, symphonies, masses, chamber music, concertos and operas, marked by vivid emotion and sophisticated textures.",
                 death: .init(date: 1791, country: .austria),
                 birthday: 1756),
        
        Composer(id: .vivaldi,
                 name: "Antonio Vivaldi",
                 info: "Antonio Vivaldi was ordained as a priest though he instead chose to follow his passion for music. A prolific composer who created hundreds of works, he became renowned for his concertos in Baroque style, becoming a highly influential innovator in form and pattern. He was also known for his operas, including Argippo and Bajazet.",
                 death: .init(date: 1741, country: .austria),
                 birthday: 1678),
        
        Composer(id: .chopin,
                 name: "Frédéric Chopin",
                 info: "Frédéric Chopin was a renowned Polish and French composer who published his first composition at age 7 and began performing one year later. In 1832, he moved to Paris, socialized with high society and was known as an excellent piano teacher. His piano compositions were highly influential.",
                 death: .init(date: 1849, country: .france),
                 birthday: 1810),
        
        Composer(id: .schubert,
                 name: "Franz Schubert",
                 info: "Composer Franz Schubert received a thorough musical education and won a scholarship to boarding school. Although he was never rich, the composer's work gained recognition and popularity, noted for bridging classical and romantic composition. He died in 1828 in Vienna, Austria.",
                 death: .init(date: 1828, country: .austria),
                 birthday: 1797),
    ]
}
